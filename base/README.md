Container images with xfce4 ui, vnc server(noVNC as well).  
Both uid and gid mapped using gosu at run stage.  

# RUN
Use `-e <key>=<val>` or `--env-file <env file>` to override environment variables
```shell script
docker run -d -p 5901:5901 -p 6901:6901 -e USR_ID=501 -e GRP_ID=20 -e USR_NAME=edward --name ubuntu18 edward852/linux-xfce-vnc-mapped-uid startup.sh

# start and stop with name(above-specified)
docker start ubuntu18
docker stop ubuntu18
```

# Access
First time booting will be slow because of updating and installing packages(language related).  

- connect via VNC viewer localhost:5901, default password: passwd
- connect via browser: http://localhost:6901/vnc.html, default password: passwd

# Environment Variables
- USR_NAME  
  default: `default`
- USR_ID  
  default: 1000
- USR_PW  
  default: `passwd` 
- GRP_ID  
  default: 1000
- USE_MIRROR  
  default: none, options: none, aliyun, 163
- LANG_ABBR  
  default: en, options: en, zh
- WITH_SUDO  
  default: yes, options: yes, no
- SUDO_WITH_PW  
  default: yes, options: yes, no
- DISPLAY  
  default: `:1`
- VNC_PW  
  default same as $USR_PW
- VNC_RES  
  default: 1136x640 
- VNC_PORT  
  default: 5901 
- NO_VNC_PORT  
  default: 6901
