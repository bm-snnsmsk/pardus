#!/bin/bash
#Sinan ŞİMŞEK | sinan.simsek@saglik.gov.tr
#https://belge.pardus.org.tr/pages/viewpage.action?pageId=35094798
#Terminalde Çözünürlül 1.ekran adı RES çözünürlük ve 2.ekran RES1 çözünürlük yazarak terminalde sh ekran.sh 
user=$(who |cut -d" " -f1)
#xrandr --prop | grep "[^dis]connected" | cut --delimiter=" " -f1> "/home/$user/ekranlar.txt"
for dir in /sys/class/drm/*/; do
    if [[ -f "$dir/status" ]]; then
        if [[ "$(cat "$dir/status")" = "connected" ]]; then
            base_name=$(basename "$dir")
            port_name=${base_name#*-}
            echo "$port_name" >> /home/$user/ekranlar.txt
        fi
    fi
done
RES="1920 1080 60" && \
DISP=$(cat "/home/$user/ekranlar.txt" | awk 'NR==1') && \
MODELINE=$(cvt $(echo $RES) | grep -e "Modeline [^(]" | sed -r 's/.*Modeline (.*)/\1/') && \
MODERES=$(echo $MODELINE | grep -o -P '(?<=").*(?=")') && \
RES1="1920 1080 60" && \
DISP1=$(cat "/home/$user/ekranlar.txt" | awk 'NR==2')
MODELINE1=$(cvt $(echo $RES1) | grep -e "Modeline [^(]" | sed -r 's/.*Modeline (.*)/\1/') && \
MODERES1=$(echo $MODELINE1 | grep -o -P '(?<=").*(?=")') && \ 
cat > /home/$user/ekran.sh << _EOF
#!/bin/bash
xrandr --newmode $MODELINE
xrandr --addmode $DISP $MODERES
xrandr --output $DISP --mode "$MODERES" --primary

xrandr --newmode $MODELINE1
xrandr --addmode $DISP1 $MODERES1
xrandr --output $DISP1 --mode "$MODERES1" --left-of $(cat "/home/$user/ekranlar.txt" | awk 'NR==2')
_EOF
 cat > /home/$user/.config/autostart/ekran.desktop << _EOF
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=ekran
Comment=
Exec=sh ekran.sh
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false  
_EOF
sudo chmod 777 /home/$user/.config/autostart/ekran.desktop