.class Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;
.super Ljava/lang/Object;
.source "CheckDownloadOriginHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/CheckDownloadOriginHelper;->doDownloadOrigin(Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

.field final synthetic val$list:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    iput-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;->val$list:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    iget-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$1;->val$list:Ljava/util/List;

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$000(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Ljava/util/List;Z)V

    return-void
.end method
