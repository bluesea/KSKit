Bugly配置,Debug模式下，记得本地导入main.js测试

文件配置初始化参数
Bugly支持读取Info.plist文件读取SDK初始化参数，可配置的参数如下：

- Appid
- Key: BuglyAppIDString
- Value: 字符串类型
- 渠道标识
- Key: BuglyAppChannelString
- Value: 字符串类型
- 版本信息
- Key: BuglyAppVersionString
- Value: 字符串类型
- 开启Debug信息显示
- Key: BuglyDebugEnable
- Value: BOOL类型
如下初始化方式，则会读取Info.plist内添加的key-value配置进行SDK初始化：


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// 读取Info.plist中的参数初始化SDK
[Bugly startWithAppId:nil];
return YES;
}

自定义日志
SDK提供自定义日志打印接口，用于记录一些关键的业务调试信息，可以更全面地反应App发生崩溃或异常时的上下文环境。

使用方式与NSLog一致，可定义日志级别以便过滤，日志接口宏定义如下：


BLYLogError(fmt, ...)
BLYLogWarn(fmt, ...)
BLYLogInfo(fmt, ...)
BLYLogDebug(fmt, ...)
BLYLogVerbose(fmt, ...)

void BLYLog(BuglyLogLevel level, NSString *format, ...);
void BLYLogv(BuglyLogLevel level, NSString *format, va_list args);
接口声明
功能配置
/**
*  SDK Debug 信息开关, 默认关闭
*/
@property (nonatomic, assign) BOOL debugMode;

/**
*  设置自定义渠道标识
*/
@property (nonatomic, copy) NSString *channel;

/**
*  设置自定义版本号
*/
@property (nonatomic, copy) NSString *version;

/**
*  设置自定义设备唯一标识
*/
@property (nonatomic, copy) NSString *deviceId;

/**
*  卡顿监控开关，默认关闭
*/
@property (nonatomic, assign) BOOL blockMonitorEnable;

/**
*  卡顿监控判断间隔，单位为秒
*/
@property (nonatomic, assign) NSTimeInterval blockMonitorTimeout;

/**
*  ATS开关，默认开启。如果关闭，SDK的网络请求不会通过HTTPS发送
*/
@property (nonatomic) BOOL appTransportSecurityEnable;

/**
*  进程内还原开关，默认开启。
*/
@property (nonatomic) BOOL symbolicateInProcessEnable;

/**
*  非正常退出事件记录开关，默认关闭
*/
@property (nonatomic) BOOL unexpectedTerminatingDetectionEnable;

/**
*  页面信息记录开关，默认开启
*/
@property (nonatomic) BOOL viewControllerTrackingEnable;

/**
*  SDK回调
*/
@property (nonatomic, assign) id<BuglyDelegate> delegate;

/**
* 控制自定义日志上报，默认值为BuglyLogLevelWarn，只上报Warn、Error的日志。
* 设置为BuglyLogLevelSilent可关闭日志上报。
*/
@property (nonatomic, assign) BuglyLogLevel reportLogLevel;

SDK回调
/**
*  发生异常时回调
*
*  @param exception 异常信息
*
*  @return 返回需上报记录，随异常上报一起上报
*/
- (NSString *)attachmentForException:(NSException *)exception;

功能接口
/**
*  初始化Bugly,使用默认BuglyConfig
*
*  @param appId 注册Bugly分配的应用唯一标识，如果appId为空，则读取Info.plist中的参数配置
*/
+ (void)startWithAppId:(nullable NSString *)appId;

/**
*  使用指定配置初始化Bugly
*
*  @param appId 注册Bugly分配的应用唯一标识
*  @param config 传入配置的 BuglyConfig
*/
+ (void)startWithAppId:(nullable NSString *)appId
config:(nullable BuglyConfig *)config;

/**
*  设置用户标识
*
*  @param userId 用户标识
*/
+ (void)setUserIdentifier:(nonnull NSString *)userId;

/**
*  更新应用版本信息
*
*  @param version 应用版本信息
*/
+ (void)updateAppVersion:(NSString *)version;

/**
*  设置关键数据，随崩溃信息上报
*
*  @param value
*  @param key
*/
+ (void)setUserValue:(nonnull NSString *)value
forKey:(nonnull NSString *)key;

/**
*  获取关键数据
*
*  @return 关键数据
*/
+ (nullable NSDictionary *)allUserValues;

/**
*  设置标签
*
*  @param tag 标签ID，可在网站生成
*/
+ (void)setTag:(NSUInteger)tag;

/**
*  获取当前设置标签
*
*  @return 当前标签ID
*/
+ (NSUInteger)currentTag;

/**
*  上报自定义异常
*
*  @param exception 异常信息
*/
+ (void)reportException:(nonnull NSException *)exception;

/**
*  上报错误
*
*  @param error 错误信息
*/
+ (void)reportError:(NSError *)error;

/**
*  SDK 版本信息
*
*  @return
*/
+ (nonnull NSString *)sdkVersion;

/**
*  获取设备ID
*
*  @return 设备ID
*/
+ (nonnull NSString *)deviceId;
