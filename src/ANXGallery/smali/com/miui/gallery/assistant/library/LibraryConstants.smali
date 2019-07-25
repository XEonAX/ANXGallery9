.class public Lcom/miui/gallery/assistant/library/LibraryConstants;
.super Ljava/lang/Object;
.source "LibraryConstants.java"


# static fields
.field public static final CURRENT_ABI:Ljava/lang/String;

.field public static final sAllLibraries:[Ljava/lang/Long;

.field public static final sImageFeatureSelectionLibraries:[Ljava/lang/Long;

.field public static final sImageProcessLibraries:[Ljava/lang/Long;

.field public static final sPhotoMovieLibraries:[Ljava/lang/Long;

.field public static final sSkyTransferLibraries:[Ljava/lang/Long;

.field public static final sStoryLibraries:[Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Long;

    const-wide/32 v2, 0xf4a11

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v1, v5

    const-wide/32 v6, 0xf51e1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v8, 0x1

    aput-object v4, v1, v8

    sput-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageFeatureSelectionLibraries:[Ljava/lang/Long;

    new-array v1, v8, [Ljava/lang/Long;

    const-wide/16 v9, 0x3f3

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v5

    sput-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sPhotoMovieLibraries:[Ljava/lang/Long;

    new-array v1, v8, [Ljava/lang/Long;

    const-wide/16 v9, 0x3f4    # 5.0E-321

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v5

    sput-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sSkyTransferLibraries:[Ljava/lang/Long;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Long;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v8

    const-wide/16 v2, 0x3ed

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v0

    sput-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sStoryLibraries:[Ljava/lang/Long;

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryUtils;->getAllLibraries()[Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->sAllLibraries:[Ljava/lang/Long;

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->sStoryLibraries:[Ljava/lang/Long;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageFeatureSelectionLibraries:[Ljava/lang/Long;

    goto :goto_0

    :cond_1
    new-array v0, v5, [Ljava/lang/Long;

    :goto_0
    sput-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageProcessLibraries:[Ljava/lang/Long;

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryUtils;->getCurrentAbi()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/library/LibraryConstants;->CURRENT_ABI:Ljava/lang/String;

    return-void
.end method
