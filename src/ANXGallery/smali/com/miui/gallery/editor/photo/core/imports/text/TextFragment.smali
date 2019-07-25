.class public Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;
.source "TextFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$ConfigListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;
    }
.end annotation


# instance fields
.field private mBubbleText:Ljava/lang/String;

.field private mCurrentIndex:I

.field private mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

.field private mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;

.field private mTextConfigDataArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;",
            ">;"
        }
    .end annotation
.end field

.field private mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

.field private mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

.field private mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

.field private mTextWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextConfigDataArray:Landroid/util/SparseArray;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentIndex:I

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentIndex:I

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentIndex:I

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;

    return-object p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-object p1
.end method

.method private performSetDialog(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->getBaseDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    if-nez v1, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->isWatermark()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->getWatermarkInfo()Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->watermarkInitSelf(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->configSelfByInit(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    :goto_0
    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->isWatermark()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mBubbleText:Ljava/lang/String;

    iput-object p1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->text:Ljava/lang/String;

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->enableStatusForCurrentItem(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;Z)V

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentIndex:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setItemDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    return-void
.end method


# virtual methods
.method public add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentIndex:I

    if-ne p2, v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemTextDialogConfig()Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isWatermark()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->text:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mBubbleText:Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->removeLastItem()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->addNewItem(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isItemActivation()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setLastItemActivation()V

    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->performSetDialog(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V

    return-void
.end method

.method public clear()V
    .locals 0

    return-void
.end method

.method public getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;-><init>()V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0071

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-direct {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$ConfigListener;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$ConfigListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setConfigChangeListener(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setTextEditorListener(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setTextWatch(Landroid/text/TextWatcher;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$StatusListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setStatusListener(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    return-object p1
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->export()Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextRenderData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEntry;)V

    return-object v0
.end method

.method protected onSample()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemTextDialogConfig()Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getSampleName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "font_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "color_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemColor()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemBold()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "bold"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemShadow()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "shadow"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    if-eq v1, v2, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "align_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->mTextEditorView:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemTransparent()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_5

    new-instance v2, Ljava/text/DecimalFormat;

    const-string v3, ".0"

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "transparent_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    float-to-double v4, v1

    invoke-virtual {v2, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    return-object v0
.end method

.method public remove(Lcom/miui/gallery/editor/photo/core/Metadata;)V
    .locals 0

    return-void
.end method

.method public render()V
    .locals 0

    return-void
.end method
