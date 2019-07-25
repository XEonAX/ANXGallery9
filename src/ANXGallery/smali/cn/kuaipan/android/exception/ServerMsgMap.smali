.class final Lcn/kuaipan/android/exception/ServerMsgMap;
.super Ljava/lang/Object;
.source "ServerMsgMap.java"


# static fields
.field private static CODE_MAP:Lcn/kuaipan/android/utils/TwoKeyHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcn/kuaipan/android/utils/TwoKeyHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-direct {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;-><init>()V

    sput-object v0, Lcn/kuaipan/android/exception/ServerMsgMap;->CODE_MAP:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    const-string v0, "badEmailFormat"

    const/16 v1, 0xca

    const v2, 0x35c29

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "sameEmailRegisteredBefore"

    const v2, 0x35c2a

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "login fail"

    const v2, 0x35c2b

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "bad openid"

    const v2, 0x35c2c

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "wrong verification code"

    const v2, 0x35c2d

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "cannot create app folder"

    const v2, 0x35c2e

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "pickupCodeNotSupport"

    const v2, 0x35c37

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "pickupCodeTooLong"

    const v2, 0x35c38

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file exist"

    const v2, 0x35c2f

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file not exist"

    const v2, 0x35c30

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "tooManyFiles"

    const v2, 0x35c31

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file too large"

    const v2, 0x35c32

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "over space"

    const v2, 0x35c33

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "fnameTooLong"

    const v2, 0x35c3b

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "commit fail"

    const v2, 0x35c34

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "forbidden"

    const v2, 0x35c35

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "account server error"

    const v2, 0x35c36

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "shared"

    const v2, 0x35c39

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "cannotBind"

    const v2, 0x35c3a

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "bad parameters"

    const v1, 0x3a981

    const/16 v2, 0x190

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "bad request"

    const v3, 0x3a982

    invoke-static {v2, v3, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "no such api implemented"

    const v3, 0x3a983

    invoke-static {v2, v3, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "clientBadParams"

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "serverError"

    const v1, 0x3a984

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "accountServerError"

    const v1, 0x3a985

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "unknownError"

    const v1, 0x3a986

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "requestFail"

    const v1, 0x3a987

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "mobileExists"

    const v1, 0x3a988

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "sendMsgError"

    const v1, 0x3a989

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "tooManyRequests"

    const v1, 0x3a98a

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "tooOften"

    const v1, 0x3a98b

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "invalidCode"

    const v1, 0x3a98c

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "invalidMobile"

    const v1, 0x3a98d

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "emptyPassword"

    const v1, 0x3a98e

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "passwordTooLong"

    const v3, 0x3a98f

    invoke-static {v2, v3, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "noSuchUser"

    const v3, 0x3a990

    invoke-static {v2, v3, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "needPassword"

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "canNotSetPassword"

    const v1, 0x3a991

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "verifyNotRequest"

    const v1, 0x3a992

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "expiredCode"

    const v1, 0x3a994

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file not exist"

    const v1, 0x3a993

    invoke-static {v2, v1, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "bad signature"

    const/16 v1, 0x191

    const v2, 0x3a9e5

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "reused nonce"

    const v2, 0x3a9e6

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "bad consumer key"

    const v2, 0x3a9e7

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "request expired"

    const v2, 0x3a9e8

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "not supported auth mode"

    const v2, 0x3a9e9

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "authorization expired"

    const v2, 0x3a9ea

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "api daily limit"

    const v2, 0x3a9eb

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "no right to call this api"

    const v2, 0x3a9ec

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "bad verifier"

    const v2, 0x3a9ed

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "authorization failed"

    const v2, 0x3a9ee

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "invalid token"

    const v2, 0x3a9ef

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file exist"

    const/16 v1, 0x193

    const v2, 0x3aaad

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "forbidden"

    const v2, 0x3aaae

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file not exist"

    const/16 v1, 0x194

    const v2, 0x3ab11

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "too many files"

    const/16 v1, 0x196

    const v2, 0x3abd9

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file too large"

    const/16 v1, 0x19d

    const v2, 0x3ae95

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "server error"

    const/16 v1, 0x1f4

    const v2, 0x3d091

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "over space"

    const/16 v1, 0x1fb

    const v2, 0x3d34d

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file exist"

    const/16 v1, 0xc8

    const v2, 0x35b61

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "commit fail"

    const v2, 0x35b68

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_BAD_PARAMS"

    const v2, 0x35b92

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_SERVER_EXCEPTION"

    const v2, 0x35b93

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_INVALID_CUSTOMERID"

    const v2, 0x35b94

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_INVALID_STOID"

    const v2, 0x35b95

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_STORAGE_REQUEST_ERROR"

    const v2, 0x35b96

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_STORAGE_REQUEST_FAILED"

    const v2, 0x35b97

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_CHUNK_OUT_OF_RANGE"

    const v2, 0x35b98

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_INVALID_UPLOAD_ID"

    const v2, 0x35b99

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_INVALID_CHUNK_POS"

    const v2, 0x35b9a

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_INVALID_CHUNK_SIZE"

    const v2, 0x35b9b

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_CHUNK_CORRUPTED"

    const v2, 0x35b9c

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_BLOCK_CORRUPTED"

    const v2, 0x35b9d

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_TOO_MANY_CURRENT_BLOCKS"

    const v2, 0x35b9e

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "ERR_STORAGE_COMMIT_ERROR"

    const v2, 0x35b9f

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "forbidden"

    const v2, 0x35b69

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "over space"

    const v2, 0x35b6a

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "targetNotExist"

    const v2, 0x35b6b

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "get stub fail"

    const v2, 0x35b6c

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "unsupportedCharRange"

    const v2, 0x35b6d

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "dataOperationFailed"

    const v2, 0x35b6e

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    const-string v0, "file too large"

    const v2, 0x35b6f

    invoke-static {v1, v2, v0}, Lcn/kuaipan/android/exception/ServerMsgMap;->add2Map(IILjava/lang/String;)V

    return-void
.end method

.method private static add2Map(IILjava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/kuaipan/android/exception/ServerMsgMap;->CODE_MAP:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p0, p2, p1}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getErrorCode(ILjava/lang/String;)I
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    :goto_0
    sget-object v0, Lcn/kuaipan/android/exception/ServerMsgMap;->CODE_MAP:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-nez p0, :cond_1

    const p0, 0x30d40

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    :goto_1
    return p0
.end method
