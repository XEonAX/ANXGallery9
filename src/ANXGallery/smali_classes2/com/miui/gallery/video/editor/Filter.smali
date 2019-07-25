.class public Lcom/miui/gallery/video/editor/Filter;
.super Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;
.source "Filter.java"


# static fields
.field private static filterIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static filterNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mFilterId:Ljava/lang/String;

.field private mIconResId:I

.field private mNameResId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/Filter$1;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/Filter$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/video/editor/Filter;->filterNames:Ljava/util/HashMap;

    new-instance v0, Lcom/miui/gallery/video/editor/Filter$2;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/Filter$2;-><init>()V

    sput-object v0, Lcom/miui/gallery/video/editor/Filter;->filterIds:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/Filter;->mIconResId:I

    iput v0, p0, Lcom/miui/gallery/video/editor/Filter;->mNameResId:I

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/video/editor/Filter;->mFilterId:Ljava/lang/String;

    iput p1, p0, Lcom/miui/gallery/video/editor/Filter;->mIconResId:I

    iput-object p2, p0, Lcom/miui/gallery/video/editor/Filter;->mType:Ljava/lang/String;

    const-string p1, "ve_type_extra"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/Filter;->mExtra:Z

    iput-object p3, p0, Lcom/miui/gallery/video/editor/Filter;->mNameKey:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/video/editor/Filter;->mLabel:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getFilterId()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/Filter;->mFilterId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/Filter;->filterIds:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/Filter;->filterIds:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/Filter;->mNameKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/Filter;->filterIds:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/Filter;->mNameKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/Filter;->mFilterId:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/Filter;->mFilterId:Ljava/lang/String;

    return-object v0
.end method

.method public getIconResId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/Filter;->mIconResId:I

    return v0
.end method

.method public getNameResId()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/Filter;->mNameResId:I

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/Filter;->filterNames:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/Filter;->filterNames:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/Filter;->mNameKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/Filter;->filterNames:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/Filter;->mNameKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/Filter;->mNameResId:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/Filter;->mNameResId:I

    return v0
.end method
