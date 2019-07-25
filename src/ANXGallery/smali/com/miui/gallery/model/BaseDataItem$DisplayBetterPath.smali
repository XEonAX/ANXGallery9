.class Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;
.super Ljava/lang/Object;
.source "BaseDataItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/model/BaseDataItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DisplayBetterPath"
.end annotation


# instance fields
.field private mPath:Ljava/lang/String;

.field private mType:I

.field final synthetic this$0:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->this$0:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->mType:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->mPath:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/model/BaseDataItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;-><init>(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method


# virtual methods
.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public setPath(ILjava/lang/String;)V
    .locals 1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->mType:I

    if-lt p1, v0, :cond_1

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->mType:I

    iput-object p2, p0, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->mPath:Ljava/lang/String;

    :cond_1
    return-void
.end method
