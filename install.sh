#!/bin/sh
chmod 777 ./pwnstarter.sh
sed -e 7a\this_path=\'`pwd`\' -i pwnstarter.sh
ln ./pwnstarter.sh /usr/bin/pwnstarter
if [ -f "uninstall.sh" ]
then
echo "there has been an uninstallation script"
exit 0
fi
echo "rm /usr/bin/pwnstarter" >> uninstall.sh
echo "uninstall.sh created"
chmod 777 ./uninstall.sh
