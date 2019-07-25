.class public Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.super Landroid/app/Activity;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/permission/core/PermissionCheckCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;,
        Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;
    }
.end annotation


# instance fields
.field private mActivatedEffects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mActivityIntent:Landroid/content/Intent;

.field private mActivityResult:I

.field private mAlertDialogCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

.field private mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

.field private mCreateTime:J

.field private mDecoderCallbacks:Lcom/miui/gallery/editor/photo/app/InitializeController$Callbacks;

.field private mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

.field private mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

.field private mExportCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

.field private mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

.field private mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

.field private mFragments:Landroid/app/FragmentManager;

.field private mGLMaskOutReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

.field private mGLReadyListener:Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext$OnCreatedListener;

.field private mInitializeController:Lcom/miui/gallery/editor/photo/app/InitializeController;

.field private mMenuCallback:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

.field private mNavigatorCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

.field private mNeedConfirmPassword:Z

.field private mOnPreviewRefreshListener:Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

.field private mPermissionCheckHelper:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

.field private mPreviewCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

.field private mPreviewRefreshedWhenInit:Z

.field private mPreviewSaveCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

.field private mReRenderCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

.field private mResumed:Z

.field private mSampleTags:[Ljava/lang/String;

.field private mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

.field private mSuspendInputs:Z

.field private mTransitionConfig:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

.field private mTransitionEnd:Z


# direct methods
.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/Effect;->values()[Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/Effect;->values()[Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionConfig:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewRefreshedWhenInit:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionEnd:Z

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityResult:I

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDecoderCallbacks:Lcom/miui/gallery/editor/photo/app/InitializeController$Callbacks;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$2;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mOnPreviewRefreshListener:Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$3;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNavigatorCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$5;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mMenuCallback:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$6;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mAlertDialogCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mReRenderCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewSaveCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$9;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$9;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mGLMaskOutReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$10;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$10;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mGLReadyListener:Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext$OnCreatedListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/beautify/BeautifyFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/adjust/AdjustMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/Effect;)V

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_beautify"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_enhance"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_filter"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_crop"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_sticker"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_beautify"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_text"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_mosaic"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_doodle"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_remover"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_miuibeautify"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    const-string v2, "_frame"

    aput-object v2, v0, v1

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->onActivityFinish(Z)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/Sampler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mCreateTime:J

    return-wide v0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Lcom/miui/gallery/editor/photo/app/MenuFragment;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->onExit(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/utils/Callback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewSaveCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNavigatorCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mMenuCallback:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setExposeButtonEnable(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/MenuFragment;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->findActiveMenu()Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->onEnterTransitionEnd()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mOnPreviewRefreshListener:Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionConfig:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewRefreshedWhenInit:Z

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->tryRefreshPreview()V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/utils/Callback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mReRenderCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    return-object p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSuspendInputs:Z

    return p1
.end method

.method private findActiveMenu()Lcom/miui/gallery/editor/photo/app/MenuFragment;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const v1, 0x7f0901cd

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Fragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_1

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;

    return-object v0

    :cond_0
    const-string v1, "PhotoEditor"

    const-string v2, "not menu in menu panel: %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    const-string v0, "PhotoEditor"

    const-string v1, "no active menu fragment found"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method private initScreenBrightness()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "photo-brightness-manual"

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v1

    const-string v3, "photo-brightness-auto"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-gez v3, :cond_0

    cmpl-float v2, v0, v2

    if-ltz v2, :cond_1

    :cond_0
    new-instance v2, Lcom/miui/gallery/view/BrightnessManager;

    invoke-direct {v2, p0, v1, v0}, Lcom/miui/gallery/view/BrightnessManager;-><init>(Landroid/app/Activity;FF)V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mResumed:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onResume()V

    :cond_1
    return-void
.end method

.method private isNeedConfirmPassword()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNeedConfirmPassword:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onActivityFinish(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionConfig:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->onExit(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const v1, 0x7f0900de

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->onExit(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->isNeedConfirmPassword()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setPhotoSecretFinishResult()V

    :cond_1
    return-void
.end method

.method private onEnterTransitionEnd()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionEnd:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->tryRefreshPreview()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isRemoveWatermarkEnable()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setRemoveWatermarkEnable(Z)V

    :cond_0
    return-void
.end method

.method private onExit(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    instance-of v0, v0, Lcom/miui/gallery/editor/photo/core/GLFragment;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    const-string v2, "PhotoEditor"

    const-string v3, "exiting gl render view"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v3, "gl_mask_out"

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_0

    const-string p1, "PhotoEditor"

    const-string v0, "display mask first"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "overwrite_background"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p1, v0}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f0900de

    const-string v2, "gl_mask_out"

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    return-void

    :cond_0
    const-string v2, "PhotoEditor"

    const-string v3, "mask displayed, remove render view"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v3, "gl_mask_in"

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string v3, "PhotoEditor"

    const-string v4, "in mask not gone"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    goto :goto_0

    :cond_1
    const-string v2, "PhotoEditor"

    const-string v3, "no gl view on top, do exit"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->popBackStackImmediate()Z

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getGestureFragment()Landroid/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v2, v3}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_3
    invoke-virtual {v2, p1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v2, "navigator"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/app/FragmentTransaction;->attach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_4
    if-eqz v0, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setExposeButtonEnable(Z)V

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v0, "gl_mask_out"

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_6

    const-string v0, "PhotoEditor"

    const-string v1, "remove mask view"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_6
    return-void
.end method

.method private prepareNavigator()V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->resolveEffects(Landroid/os/Bundle;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivatedEffects:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivatedEffects:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/Effect;->values()[Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sget-object v3, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Lcom/miui/gallery/editor/photo/core/SdkManager;->getProvider(Lcom/miui/gallery/editor/photo/core/Effect;)Lcom/miui/gallery/editor/photo/core/SdkProvider;

    move-result-object v3

    if-nez v3, :cond_0

    const-string v3, "PhotoEditor"

    const-string v4, "%s not supported, skip"

    aget-object v5, v1, v2

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivatedEffects:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->showNavigator()V

    return-void
.end method

.method private prepareResult(Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    if-eqz v0, :cond_0

    const-string v0, "photo_edit_exported_width"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getExportedWidth()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "photo_edit_exported_height"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getExportedHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method private resolveEffects(Landroid/os/Bundle;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p1, :cond_1

    sget-object v5, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v5, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_LONG_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    new-array v0, v1, [Ljava/lang/Integer;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    new-array v0, v0, [Ljava/lang/Integer;

    sget-object v5, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v0, v4

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v0, v3

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    sget-object v2, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/Integer;

    sget-object v6, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v6}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    sget-object v4, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v5, v3

    sget-object v3, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    sget-object v2, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x5

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x6

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x7

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    const/16 v0, 0x8

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->idBeautyAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampleTags:[Ljava/lang/String;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v2

    aget-object v1, v1, v2

    const-string v2, "category_show"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/editor/photo/app/remover/Inpaint;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object p1
.end method

.method private resolveNavigator(Landroid/os/Bundle;)Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;
    .locals 1

    if-eqz p1, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;-><init>()V

    return-object p1

    :cond_0
    new-instance p1, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;-><init>()V

    return-object p1
.end method

.method private setExposeButtonEnable(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v1, "navigator"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->setExportEnabled(Z)V

    :cond_0
    return-void
.end method

.method private setPhotoSecretFinishResult()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->prepareResult(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    const-string v1, "photo_secret_finish"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    const-string v1, "extra_photo_edit_type"

    const-string v2, "extra_photo_editor_type_common"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityResult:I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setResult(ILandroid/content/Intent;)V

    return-void
.end method

.method private showNavigator()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->resolveNavigator(Landroid/os/Bundle;)Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "content"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivatedEffects:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    const/16 v2, 0x2002

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->setTransition(I)Landroid/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "navigator"

    const v3, 0x7f0901cd

    invoke-virtual {v1, v3, v0, v2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    return-void
.end method

.method private tryRefreshPreview()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewRefreshedWhenInit:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionEnd:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->refreshPreview(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSuspendInputs:Z

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSuspendInputs:Z

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isPermissionRequired(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setPhotoSecretFinishResult()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->finish()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNeedConfirmPassword:Z

    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onAttachFragment(Landroid/app/Fragment;)V
    .locals 3

    instance-of v0, p1, Lcom/miui/gallery/editor/photo/app/MenuFragment;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mMenuCallback:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/MenuFragment$Callbacks;

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNavigatorCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    goto :goto_0

    :cond_1
    instance-of v0, p1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPreviewCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    const-string v1, "gl_mask_out"

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mGLMaskOutReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOnViewReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

    goto :goto_0

    :cond_2
    instance-of v0, p1, Lcom/miui/gallery/editor/photo/app/ExportFragment;

    if-eqz v0, :cond_3

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/editor/photo/app/ExportFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->setCallbacks(Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;)V

    goto :goto_0

    :cond_3
    instance-of v0, p1, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mAlertDialogCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->setCallbacks(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;)V

    :cond_4
    :goto_0
    instance-of v0, p1, Lcom/miui/gallery/editor/photo/core/GLFragment;

    if-eqz v0, :cond_5

    check-cast p1, Lcom/miui/gallery/editor/photo/core/GLFragment;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/GLFragment;->getGLContext()Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mGLReadyListener:Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext$OnCreatedListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;->setOnCreatedListener(Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext$OnCreatedListener;)V

    :cond_5
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    invoke-static {p0}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SystemUiUtil;->extendToStatusBar(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const v1, 0x7f0901cd

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    const-string v0, "PhotoEditor"

    const-string v1, "back pressed on navigator"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "PhotoEditor"

    const-string v1, "have pending operation"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;-><init>()V

    const v1, 0x7f10045f

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setMessage(I)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    const v1, 0x7f100461

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setPositiveButton(I)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    const v1, 0x7f100460

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setNegativeButton(I)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setCancellable(Z)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->build()Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v2, "main_alert_dialog"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void

    :cond_0
    instance-of v1, v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;

    if-eqz v1, :cond_2

    const-string v1, "PhotoEditor"

    const-string v3, "back pressed on menu"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    check-cast v0, Lcom/miui/gallery/editor/photo/app/MenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "PhotoEditor"

    const-string v1, "menu has pending operation"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;-><init>()V

    const v1, 0x7f1006bb

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setMessage(I)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    const v1, 0x7f1006bd

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setPositiveButton(I)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    const v1, 0x7f1006bc

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setNegativeButton(I)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->setCancellable(Z)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;->build()Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v2, "menu_alert_dialog"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->onExit(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    return-void

    :cond_2
    const-string v0, "PhotoEditor"

    const-string v1, "neither handled back press event, just call default"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->onActivityFinish(Z)V

    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "allow_use_on_offline_global"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->setToAllowUseOnOfflineGlobal(Z)V

    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/WindowCompat;->setCutoutModeShortEdges(Landroid/view/Window;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionConfig:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->onActivityCreate(Z)V

    new-instance p1, Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p1, p0, v0, v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->from(Landroid/app/Activity;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

    if-nez p1, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/compat/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    const p1, 0x7f100426

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void

    :cond_1
    const p1, 0x7f0b00f7

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/Sampler;->from(Landroid/os/Bundle;)Lcom/miui/gallery/editor/photo/app/Sampler;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

    new-instance p1, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->getSource()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    new-instance p1, Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    invoke-direct {p1, p0, v2, p0}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;-><init>(Landroid/app/Activity;ZLcom/miui/gallery/permission/core/PermissionCheckCallback;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPermissionCheckHelper:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPermissionCheckHelper:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->checkPermission()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDraftManager:Lcom/miui/gallery/editor/photo/app/DraftManager;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mExportTask:Lcom/miui/gallery/editor/photo/app/ExportTask;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->closeExportDialog()V

    :cond_1
    return-void
.end method

.method protected onPause()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mResumed:Z

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->findActiveMenu()Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/GLFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/GLFragment;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/GLFragment;->getGLContext()Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;->performPause()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onPause()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordPageEnd(Landroid/app/Activity;)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->onPagePause()V

    return-void
.end method

.method public onPermissionsChecked([Ljava/lang/String;[I)V
    .locals 2

    new-instance p1, Lcom/miui/gallery/editor/photo/app/InitializeController;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mDecoderCallbacks:Lcom/miui/gallery/editor/photo/app/InitializeController$Callbacks;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/app/InitializeController;-><init>(Landroid/app/Activity;Lcom/miui/gallery/editor/photo/app/InitializeController$Callbacks;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mInitializeController:Lcom/miui/gallery/editor/photo/app/InitializeController;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mInitializeController:Lcom/miui/gallery/editor/photo/app/InitializeController;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/InitializeController;->doInitialize()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mCreateTime:J

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

    const-string p2, "_main"

    const-string v0, "enter"

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordEvent(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/filtersdk/BeautificationSDK;->init(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mTransitionConfig:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->postActivityCreate()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->initScreenBrightness()V

    new-instance p1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;-><init>()V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setLoadDone(Z)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p2

    const-string v0, "preview"

    const v1, 0x7f0900de

    invoke-virtual {p2, v1, p1, v0}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->prepareNavigator()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mPermissionCheckHelper:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method protected onResume()V
    .locals 2

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->findActiveMenu()Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/GLFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/GLFragment;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/GLFragment;->getGLContext()Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;->performResume()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onResume()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mSampler:Lcom/miui/gallery/editor/photo/app/Sampler;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordPageStart(Landroid/app/Activity;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mResumed:Z

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->onPageResume()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->isNeedConfirmPassword()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNeedConfirmPassword:Z

    const/16 v0, 0x1b

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Activity;I)V

    :cond_2
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    const-string p1, "PhotoEditor"

    const-string v0, "onSaveInstanceState"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onStart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->onStart()V

    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mNeedConfirmPassword:Z

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mEditorOriginHandler:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->onDestroy()V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/view/BrightnessManager;->onWindowFocusChanged(Z)V

    :cond_0
    return-void
.end method

.method public setActivityResult(ILandroid/content/Intent;)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityResult:I

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->prepareResult(Landroid/content/Intent;)V

    const-string p1, "extra_photo_edit_type"

    const-string v0, "extra_photo_editor_type_common"

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityResult:I

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mActivityIntent:Landroid/content/Intent;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setResult(ILandroid/content/Intent;)V

    return-void
.end method

.method public showEditFragment(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result p1

    aget-object p1, v0, p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->renderTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/RenderFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->gestureTag:Ljava/lang/String;

    invoke-virtual {v1, p1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/FragmentTransaction;->show(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz p1, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/app/FragmentTransaction;->show(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    const/4 v2, 0x1

    :cond_1
    if-eqz v2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    const-string v2, "preview"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_3
    instance-of p1, v0, Lcom/miui/gallery/editor/photo/core/GLFragment;

    if-eqz p1, :cond_4

    new-instance p1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "overwrite_background"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f0900de

    const-string v2, "gl_mask_in"

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->mFragments:Landroid/app/FragmentManager;

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_4
    return-void
.end method

.method public showPermissionIntroduction(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/permission/PermissionIntroductionUtils;->showPermissionIntroduction(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    return-void
.end method
