.class Lcom/miui/gallery/share/SharerPublicShareUiHandler$1;
.super Ljava/lang/Object;
.source "SharerPublicShareUiHandler.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/SharerPublicShareUiHandler;->tryToRequestPublicUrl()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/SharerPublicShareUiHandler;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/SharerPublicShareUiHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/SharerPublicShareUiHandler$1;->onCompletion(Ljava/lang/Void;Ljava/lang/String;IZ)V

    return-void
.end method

.method public onCompletion(Ljava/lang/Void;Ljava/lang/String;IZ)V
    .locals 0

    if-eqz p4, :cond_0

    return-void

    :cond_0
    if-nez p3, :cond_1

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/SharerPublicShareUiHandler;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    xor-int/lit8 p3, p3, 0x1

    invoke-virtual {p1, p3, p2}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V

    :cond_1
    return-void
.end method
