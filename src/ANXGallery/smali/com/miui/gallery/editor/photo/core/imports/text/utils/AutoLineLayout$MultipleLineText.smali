.class Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;
.super Ljava/lang/Object;
.source "AutoLineLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MultipleLineText"
.end annotation


# instance fields
.field private mHeight:F

.field private mLongestText:Ljava/lang/String;

.field private mSingleLineTextList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;",
            ">;"
        }
    .end annotation
.end field

.field private mWidth:F

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mSingleLineTextList:Ljava/util/List;

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mLongestText:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mHeight:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mWidth:F

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mSingleLineTextList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mLongestText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mLongestText:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mWidth:F

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mWidth:F

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->reset()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mHeight:F

    return p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mHeight:F

    return p1
.end method

.method private reset()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mSingleLineTextList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mHeight:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->mWidth:F

    return-void
.end method
