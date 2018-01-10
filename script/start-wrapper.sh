TARGET="xinwei-wrapper-example-"$2
VERSION="$1"
ZIPNAME="$TARGET-$VERSION-bin.tar"

echo "TARGET=$TARGET"
echo "VERSION=$VERSION"
echo "ZIPNAME=$ZIPNAME"

echo "停止$TARGET-$VERSION"
pid=`ps aux | grep $TARGET | grep -v grep | grep -v PPID | grep -v start-wrapper.sh | awk '{print $2}'`
if [ -n "$pid" ]; then
for subPid in $pid
do
        echo "关闭$TARGET进程:$subPid"
        kill -9 $subPid
done
else
echo "$TARGET进程不存在"
fi

cd /usr/local/workspace/

if [ ! -d $TARGET ]; then
echo $TARGET"不存在"
else
echo "删除文件夹"$TARGET
rm -rf $TARGET
fi

if [ ! -f $ZIPNAME ]; then
echo $ZIPNAME"不存在"
else
echo "解压"$ZIPNAME
tar -xf $ZIPNAME
ls | grep bin.tar | grep -v $ZIPNAME | xargs rm
fi

echo "启动$TARGET-$VERSION"

source /etc/profile
/usr/local/workspace/$TARGET/bin/service.sh start