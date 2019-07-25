.class Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/a;
.super Ljava/lang/Object;
.source "WrapMediaCodec.java"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    const-string p0, "UNKNOWN"

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    const-string p0, "BUFFER_FLAG_CODEC_CONFIG"

    return-object p0

    :pswitch_1
    const-string p0, "BUFFER_FLAG_END_OF_STREAM"

    return-object p0

    :pswitch_2
    const-string p0, "INFO_TRY_AGAIN_LATER"

    return-object p0

    :pswitch_3
    const-string p0, "INFO_OUTPUT_FORMAT_CHANGED"

    return-object p0

    :pswitch_4
    const-string p0, "INFO_OUTPUT_BUFFERS_CHANGED"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
