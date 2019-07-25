.class final Lcom/miui/gallery/share/AlbumShareUIManager$23;
.super Ljava/lang/Object;
.source "AlbumShareUIManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareUIManager;->showDialogToAccept(Landroid/app/Activity;Lcom/miui/gallery/share/CloudSharerMediaSet;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$denyListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

.field final synthetic val$path:Lcom/miui/gallery/share/Path;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareUIManager$23;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareUIManager$23;->val$path:Lcom/miui/gallery/share/Path;

    iput-object p3, p0, Lcom/miui/gallery/share/AlbumShareUIManager$23;->val$denyListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/share/AlbumShareUIManager$23;->val$activity:Landroid/app/Activity;

    iget-object p2, p0, Lcom/miui/gallery/share/AlbumShareUIManager$23;->val$path:Lcom/miui/gallery/share/Path;

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$23;->val$denyListener:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->access$100(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void
.end method
