
### 对照代码看Nginx对HTTP请求的处理


一、测试环境

```
server {
    listen      80;
    server_name example.org www.example.org;
    ...
}

server {
    listen      80;
    server_name example.net www.example.net;
    ...
}

server {
    listen      80;
    server_name example.com www.example.com;
    ...
}
```

二、处理流程


三、相关代码


四、GDB跟进





