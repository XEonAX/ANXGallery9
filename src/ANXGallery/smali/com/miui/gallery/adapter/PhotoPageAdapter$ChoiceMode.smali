.class public Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;
.super Ljava/lang/Object;
.source "PhotoPageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/PhotoPageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChoiceMode"
.end annotation


# instance fields
.field private mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

.field private mInAction:Z

.field private mOriginCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

.field private mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

.field private mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

.field private mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

.field private mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

.field private mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

.field private mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mInAction:Z

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-direct {v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-direct {v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-direct {v0, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    iput-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    iput-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mInAction:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->isInAction()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    return-object p0
.end method

.method private isInAction()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mInAction:Z

    return v0
.end method

.method private refreshAllState(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->getCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v2, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->getItemKey(I)J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v4, v1, v2, v3, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->setChecked(IJZ)V

    if-nez p1, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v4, v1, v2, v3, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->setChecked(IJZ)V

    iget-object v4, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v4, v1, v2, v3, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->setChecked(IJZ)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->notifyCheckState()V

    return-void
.end method


# virtual methods
.method public appendCheck(IJ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->appendCheck(IJ)V

    return-void
.end method

.method public chooseAll()V
    .locals 2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->refreshAllState(Z)V

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    invoke-interface {v1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Z)V

    :cond_0
    return-void
.end method

.method public finish()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mInAction:Z

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->notifyCheckState()V

    return-void
.end method

.method public finishInit()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->notifyCheckState()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    iget-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->getItemKey(I)J

    move-result-wide v3

    const/4 v1, 0x1

    invoke-interface {v0, v2, v3, v4, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;->onItemCheckedStateChanged(IJZ)V

    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->getCount()I

    move-result v0

    return v0
.end method

.method protected getOriginIInstance()Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode$1;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    return-object v0
.end method

.method public getOriginItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->getSelectedPositions()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getRenderIInstance()Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode$3;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    return-object v0
.end method

.method public getRenderItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->getSelectedPositions()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectIInstance()Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode$2;-><init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    return-object v0
.end method

.method public getSelectItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->getSelectedPositions()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public notifyDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mOriginCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->notifyDataChanged()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->notifyDataChanged()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->notifyDataChanged()V

    return-void
.end method

.method public setChecked(IJZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSelectCheck:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->setChecked(IJZ)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->notifyCheckState()V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;->onItemCheckedStateChanged(IJZ)V

    :cond_0
    return-void
.end method

.method public setRenderChecked(IJZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mRenderState:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->setChecked(IJZ)V

    return-void
.end method

.method startAction()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mInAction:Z

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->notifyCheckState()V

    return-void
.end method

.method public unChooseAll()V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->refreshAllState(Z)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->mChoiceModeListener:Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Z)V

    :cond_0
    return-void
.end method
