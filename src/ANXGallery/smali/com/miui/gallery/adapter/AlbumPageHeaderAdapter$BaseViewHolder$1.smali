.class Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;
.super Ljava/lang/Object;
.source "AlbumPageHeaderAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->bindClickListener(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;

.field final synthetic val$album:Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;->this$0:Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;

    iput-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;->val$album:Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    iput-object p3, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;->val$album:Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    iget-object v0, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mActionUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
