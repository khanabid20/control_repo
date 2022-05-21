[Unit]
Description=Minecraft Server

Wants=network.target
After=network.target

[Service]
WorkingDirectory=<%=install_dir%>
ExecStart=/usr/bin/java -Xms32M -Xmx512M -jar minecraft_server.jar nogui

[Install]
WantedBy=multi-user.target