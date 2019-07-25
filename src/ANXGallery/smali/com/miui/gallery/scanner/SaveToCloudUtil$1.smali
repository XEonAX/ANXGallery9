.class final Lcom/miui/gallery/scanner/SaveToCloudUtil$1;
.super Ljava/lang/Object;
.source "SaveToCloudUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/scanner/SaveToCloudUtil;->requestThumbnail(Landroid/content/Context;Landroid/content/ContentValues;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;

.field final synthetic val$file:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$1;->val$app:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$1;->val$file:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$1;->val$app:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$1;->val$file:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->access$300(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
