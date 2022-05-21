commit=true
origin=$(git remote get-url origin)
if [[ $origin == *AGDDoS/statuspage* ]]
then
  commit=false
fi

KEYSARRAY=()
URLSARRAY=()

urlsConfig="./urls.cfg"
echo "Reading $urlsConfig"
while read -r line
do
  echo "  $line"
  IFS='=' read -ra TOKENS <<< "$line" # Use the equals sign to separate the kEY and URL
  KEYSARRAY+=(${TOKENS[0]})
  URLSARRAY+=(${TOKENS[1]})
done < "$urlsConfig"

echo "00---------------------00"
echo "Starting health checks with ${#KEYSARRAY[@]} configs:"

mkdir -p logs

for (( index=0; index < ${#KEYSARRAY[@]}; index++))
do
  key="${KEYSARRAY[index]}"
  url="${URLSARRAY[index]}"
  echo "> $key=$url"

  for i in 1 2 3 4 5; 
  do
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $url)
    if [ "$response" -eq 200 ] || [ "$response" -eq 202 ] || [ "$response" -eq 301 ] || [ "$response" -eq 302 ] || [ "$response" -eq 418 ]; then
      result="success"
      echo "[*] $url is up (Code: $response)"
    else
      result="failed"
      echo "[!] $url is down(times $i), wait and retry."
    fi
    if [ "$result" = "success" ]; then
      break
    fi
    sleep 1 # 等待1s重试
  done
  dateTime=$(date +'%Y-%m-%d %H:%M')
  if [[ $commit == true ]]
  then
    echo $dateTime, $result >> "logs/${key}_report.log"
    echo "$(tail -1400 logs/${key}_report.log)" > "logs/${key}_report.log"
    # By default we keep 14*100=1400 last log entries.  Feel free to modify this to meet your needs.
  else
    echo "    $dateTime, $result"
  fi
done

if [[ $commit == true ]]
then
  # Let's make "AGDDoS-bot" the most productive person on GitHub.
  git config --global user.name 'AGDDoS-bot'
  git config --global user.email '3356136957@qq.com'
  git add -A --force logs/
  git commit -am '[Automated] Update Health Check Logs [skip ci]'
  git push
fi
