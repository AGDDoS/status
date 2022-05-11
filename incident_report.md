#### 2022 May 11 07:57 API

原因：CloudFlare边缘节点超时*3.基本上每一天都会这样一次

已恢复，但无法正确解决.附上日志：
```
Reading ./urls.cfg
  ghproxy=https://index.pig2333.workers.dev
  api=https://api.pig2333.workers.dev
  btapi=http://api.btstu.cn/
  webshell=https://webshell.pig2333.workers.dev
  proxy=https://proxy.pig2333.workers.dev
  weeaxe=https://weeaxe.cn
  weeaxemap=https://map.weeaxe.cn
  broken=http://thiswebsidedoesnotexist.com
hB--------------------$
Starting health checks with 8 configs:
> ghproxy=https://index.pig2333.workers.dev
[*] https://index.pig***3.workers.dev is up (Code: 200)
> api=https://api.pig2333.workers.dev
[!] https://api.pig2333.workers.dev is down(times 1), wait and retry.
[!] https://api.pig2333.workers.dev is down(times 2), wait and retry.
[!] https://api.pig2333.workers.dev is down(times 3), wait and retry.
> btapi=http://api.**stu.cn/
[*] http://api.***tu.cn/ is up (Code: 200)
> webshell=https://webshell.pig2***.workers.dev
[*] https://webshell.p***333.workers.dev is up (Code: 200)
> proxy=https://proxy.p***333.workers.dev
[*] https://proxy.pig2333.w**kers.dev is up (Code: 200)
> weeaxe=https://w**axe.cn
[*] https://weeaxe.cn is up (Code: 301)
> weeaxemap=https://map.w**axe.cn
[*] https://map.**eaxe.cn is up (Code: 302)
> broken=http://thiswebsidedoesnot*****.om
[!] http://thiswebsidedoesn******st.com is down(times 1), wait and retry.
[!] http://thiswebsidedoesno****st.com is down(times 2), wait and retry.
[!] http://thiswebsidedoesno***ist.com is down(times 3), wait and retry.
[master f8***88] [Aut***ted] ***ate *******heck Logs [skip ci]
 * files changed, * insertions(+)
To https://github.com/****/***
   2***cc*..f***88  ma***r -> mast**
```

---
#### 2022-05-08 14:18 API
> 又是他，API！

原因：CloudFlare边缘节点超时+时区问题（无法修复）

---
#### 2022-05-03 21:52 API

原因：CloudFlare边缘节点超时

2022-05-03 22:18 api恢复正常

---
#### 2022/04/07 10:00 Github网页代理服务(ghproxy)

原因：网站被攻击

2022-04-07 12:00 ghproxy恢复正常
