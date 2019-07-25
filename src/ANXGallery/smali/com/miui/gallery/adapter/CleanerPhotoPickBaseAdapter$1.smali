.class Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;
.super Ljava/lang/Object;
.source "CleanerPhotoPickBaseAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;->this$0:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iput p2, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouchValid(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;->this$0:Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;

    iget v1, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;->val$position:I

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->access$000(Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;Landroid/view/View;I)V

    return-void
.end method
