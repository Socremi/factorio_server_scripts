echo "========================"
echo "Stopping Factorio Server"
echo "========================"
systemctl stop factorio-server.service  # Factorio server triggers saving on exit

echo "Downloading latest version from factorio.com"
wget https://factorio.com/get-download/stable/headless/linux64 -O factorio-headless-update.tar.xz

echo "unpacking..."
tar -xvf factorio-headless-update.tar.xz -C /opt/

echo "Update complete."

echo "Cleaning up files and setting permissions..."
rm factorio-headless-update.tar.xz

# This line allocations permissions to the user that will be running the factorio server. 
# If it is a different user, change this line to suit.
chown -R factorio:factorio /opt/factorio


echo "++++++++++++++++++++++++"
echo "Starting Factorio Server"
echo "++++++++++++++++++++++++"
systemctl start factorio-server.service

# echo "Checking start status..."
# echo systemctl status factorio-server.service