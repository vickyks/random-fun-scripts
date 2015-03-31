
cp rotate-wallpaper /etc/cron.hourly/rotate-wallpaper

echo "*/5 *    * * *   $USER    $(sh /etc/cron.hourly/rotate-wallpaper) )" >> /etc/crontab

