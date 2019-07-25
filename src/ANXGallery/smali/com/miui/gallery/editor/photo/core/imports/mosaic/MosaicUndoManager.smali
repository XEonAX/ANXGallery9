.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;
.super Ljava/lang/Object;
.source "MosaicUndoManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;,
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;
    }
.end annotation


# instance fields
.field private final mBitmapHeight:I

.field private final mBitmapWidth:I

.field private final mBufferItems:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;

.field private final mMosaicOperationItems:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mReuseBufferItem:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;",
            ">;"
        }
    .end annotation
.end field

.field private final mRevokedBufferItems:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;",
            ">;"
        }
    .end annotation
.end field

.field private final mRevokedOperationItems:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mViewHeight:I

.field private final mViewWidth:I


# direct methods
.method constructor <init>(IIII)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedOperationItems:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mReuseBufferItem:Ljava/util/Stack;

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBitmapWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBitmapHeight:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mViewWidth:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mViewHeight:I

    return-void
.end method

.method private addNewOperationItem(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;

    invoke-direct {v0, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->add(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private clearRevokedItem()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mReuseBufferItem:Ljava/util/Stack;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public canRevert()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public canRevoke()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public capture(Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v1, 0x4100

    const/4 v2, 0x6

    if-ge v0, v2, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mReuseBufferItem:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mReuseBufferItem:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBitmapWidth:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBitmapHeight:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mViewWidth:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mViewHeight:I

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;-><init>(IIII)V

    :goto_0
    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->drawFBO(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->drawFBO(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mCaptureListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mCaptureListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;->onCapture()V

    :cond_2
    return-void
.end method

.method public clearBuffer()V
    .locals 1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->clear()V

    goto :goto_0

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->clear()V

    goto :goto_1

    :cond_1
    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mReuseBufferItem:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mReuseBufferItem:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->clear()V

    goto :goto_2

    :cond_2
    return-void
.end method

.method public doRevert()Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->canRevert()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;->paintingItem:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;->mosaicGLEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->record(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public doRevoke()Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->canRevoke()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedOperationItems:Ljava/util/LinkedList;

    new-instance v3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->mosaicGLEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->removeLast()Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$RevokedItem;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mRevokedBufferItems:Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mBufferItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object v0
.end method

.method public exportRecord()Ljava/util/LinkedList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    return-object v0
.end method

.method public generateSample()Ljava/util/List;
    .locals 3
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

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->mosaicGLEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;->name:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public isEmpty()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->isEmpty()Z

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public record(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;Z)V
    .locals 1

    if-eqz p3, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->clearRevokedItem()V

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {p3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->addNewOperationItem(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    goto :goto_0

    :cond_1
    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mMosaicOperationItems:Ljava/util/LinkedList;

    invoke-virtual {p3}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;

    iget-object v0, p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->mosaicGLEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    if-ne v0, p2, :cond_2

    invoke-virtual {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->add(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->addNewOperationItem(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    :goto_0
    return-void
.end method

.method public setCaptureListener(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->mCaptureListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager$CaptureListener;

    return-void
.end method
