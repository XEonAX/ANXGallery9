.class public Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;
.super Ljava/lang/Object;
.source "TextEditorView.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextEntry"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mITextDialogConfigList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mRectF:Landroid/graphics/RectF;

.field private mResource:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/graphics/RectF;Ljava/util/List;Landroid/content/res/Resources;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/RectF;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;",
            ">;",
            "Landroid/content/res/Resources;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mRectF:Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mITextDialogConfigList:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mResource:Landroid/content/res/Resources;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mRectF:Landroid/graphics/RectF;

    const-class v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mRectF:Landroid/graphics/RectF;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mITextDialogConfigList:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mITextDialogConfigList:Ljava/util/List;

    const-class v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    return-void
.end method


# virtual methods
.method protected apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->copyBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mRectF:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v2, v0, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mITextDialogConfigList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    invoke-interface {v2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;->mITextDialogConfigList:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    return-void
.end method
