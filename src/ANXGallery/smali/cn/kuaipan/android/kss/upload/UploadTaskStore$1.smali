.class Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;
.super Lcn/kuaipan/android/utils/SyncAccessor;
.source "UploadTaskStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/kss/upload/UploadTaskStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;


# direct methods
.method constructor <init>(Lcn/kuaipan/android/kss/upload/UploadTaskStore;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-direct {p0, p2}, Lcn/kuaipan/android/utils/SyncAccessor;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public varargs handleAccess(I[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2}, Lcn/kuaipan/android/utils/SyncAccessor;->handleAccess(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_1

    :pswitch_0
    aget-object p1, p2, v0

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iget-object p2, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-static {p2}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->access$000(Lcn/kuaipan/android/kss/upload/UploadTaskStore;)Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;

    move-result-object p2

    invoke-static {}, Lcn/kuaipan/android/utils/OAuthTimeUtils;->currentTime()J

    move-result-wide v0

    const-wide/32 v2, 0x516bc00

    sub-long/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;->deleteBefore(J)V

    :try_start_0
    iget-object p2, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-static {p2}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->access$000(Lcn/kuaipan/android/kss/upload/UploadTaskStore;)Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;

    move-result-object p2

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-static {v0}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->access$100(Lcn/kuaipan/android/kss/upload/UploadTaskStore;)Lcn/kuaipan/android/kss/IDataFactory;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;->queryKss(ILcn/kuaipan/android/kss/IDataFactory;)Lcn/kuaipan/android/kss/upload/KssUploadInfo;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "UploadTaskStore"

    const-string v0, "Meet exception when parser kss from db"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :pswitch_1
    aget-object p1, p2, v0

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iget-object p2, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-static {p2}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->access$000(Lcn/kuaipan/android/kss/upload/UploadTaskStore;)Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;->queryPos(I)Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;

    move-result-object p1

    goto :goto_1

    :pswitch_2
    aget-object p1, p2, v0

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iget-object p2, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-static {p2}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->access$000(Lcn/kuaipan/android/kss/upload/UploadTaskStore;)Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;->delete(I)V

    goto :goto_0

    :pswitch_3
    aget-object p1, p2, v0

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Lcn/kuaipan/android/kss/upload/KssUploadInfo;

    const/4 v1, 0x2

    aget-object p2, p2, v1

    check-cast p2, Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/UploadTaskStore$1;->this$0:Lcn/kuaipan/android/kss/upload/UploadTaskStore;

    invoke-static {v1}, Lcn/kuaipan/android/kss/upload/UploadTaskStore;->access$000(Lcn/kuaipan/android/kss/upload/UploadTaskStore;)Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;

    move-result-object v1

    invoke-virtual {v1, p1, v0, p2}, Lcn/kuaipan/android/kss/upload/UploadTaskStore$DBHelper;->update(ILcn/kuaipan/android/kss/upload/KssUploadInfo;Lcn/kuaipan/android/kss/upload/UploadChunkInfoPersist;)V

    :goto_0
    const/4 p1, 0x0

    :goto_1
    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
