.class public Lcom/miui/gallery/cloud/ServerErrorCode;
.super Ljava/lang/Object;
.source "ServerErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/ServerErrorCode$MiCloudServerExceptionHandler;,
        Lcom/miui/gallery/cloud/ServerErrorCode$ExceptionWithErrorCode;,
        Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;,
        Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;
    }
.end annotation


# static fields
.field private static final sAlbumNotEmptyHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

.field private static final sAlbumNotExistsHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

.field private static sExceptionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final sGalleryNotFoundHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

.field public static final sGalleryServerErrors:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;",
            ">;"
        }
    .end annotation
.end field

.field private static final sNoErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

.field private static final sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

.field private static final sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

.field private static final sSpaceFullHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$1;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sNoErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$2;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$2;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sSpaceFullHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$3;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$3;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$4;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$4;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$5;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$5;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryNotFoundHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$6;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$6;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sAlbumNotExistsHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    new-instance v0, Lcom/miui/gallery/cloud/ServerErrorCode$7;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/ServerErrorCode$7;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sAlbumNotEmptyHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNoErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v1, 0x2711

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v1, 0x2730

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v1, 0x507f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v1, 0x59d8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc355

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc352

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc353

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc357

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc35a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc361

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc366

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc356

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sSpaceFullHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc360

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_CONTINUE_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc363

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v2, 0x2718

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const/16 v6, 0x2718

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v2, 0x2721

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const/16 v6, 0x2721

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v2, 0x4e2e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const/16 v6, 0x4e2e

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc351

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc351

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc354

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc354

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc358

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryNotFoundHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc358

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc359

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc359

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc35b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc35b

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc35d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc35d

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc35f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc35f

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v2, 0xc362

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v6, 0xc362

    invoke-direct {v3, v6, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v4, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v5, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc364

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc364

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc365

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc365

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc367

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc367

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc368

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc368

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc369

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc369

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc36a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc36a

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc36b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc36b

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc36c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc36c

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc36d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc36d

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc36e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc36e

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0x13884

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0x13884

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc35c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EXIST:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sAlbumNotExistsHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc35c

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xc35e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->ALBUM_NOT_EMPTY:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sAlbumNotEmptyHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0xc35e

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0x9c43

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const v5, 0x9c43

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const/16 v1, 0x2720

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v4, Lcom/miui/gallery/cloud/ServerErrorCode;->sNotRetryErrorHandler:Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;

    const/16 v5, 0x2720

    invoke-direct {v2, v5, v3, v4}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sGalleryServerErrors:Ljava/util/HashMap;

    const v1, 0xcb20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->RESET_SYNC_TAG:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    const v4, 0xcb20

    const/4 v5, 0x0

    invoke-direct {v2, v4, v3, v5}, Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorCodeItem;-><init>(ILcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljavax/crypto/IllegalBlockSizeException;

    const/16 v2, -0x65

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljavax/crypto/BadPaddingException;

    const/16 v2, -0x66

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Lorg/json/JSONException;

    const/16 v2, -0x67

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/io/IOException;

    const/16 v2, -0x68

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;

    const/16 v2, -0x69

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/net/MalformedURLException;

    const/16 v2, -0x6a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/io/UnsupportedEncodingException;

    const/16 v2, -0x6b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Lorg/apache/http/client/ClientProtocolException;

    const/16 v2, -0x6c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/net/URISyntaxException;

    const/16 v2, -0x6d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/lang/UnsupportedOperationException;

    const/16 v2, -0x6e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/net/SocketTimeoutException;

    const/16 v2, -0x6f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    const-class v1, Ljava/net/UnknownHostException;

    const/16 v2, -0x70

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/ServerErrorCode;->hasUnCreatedGroupInLocalDB(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/ServerErrorCode;->hasDeleteItemsInAGroup(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/ServerErrorCode;->cancelDeleteGroupOperation(Ljava/lang/String;)V

    return-void
.end method

.method private static cancelDeleteGroupOperation(Ljava/lang/String;)V
    .locals 5

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "localFlag"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const-string v3, "_id = ? "

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    aput-object p0, v4, v2

    invoke-static {v1, v0, v3, v4}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static fromThrowable(Ljava/lang/Throwable;)I
    .locals 4

    instance-of v0, p0, Lcom/miui/gallery/cloud/ServerErrorCode$ExceptionWithErrorCode;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/miui/gallery/cloud/ServerErrorCode$ExceptionWithErrorCode;

    iget p0, p0, Lcom/miui/gallery/cloud/ServerErrorCode$ExceptionWithErrorCode;->mErrorCode:I

    return p0

    :cond_0
    const/4 v0, -0x2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_0
    const-class v2, Ljava/lang/Object;

    if-eq v1, v2, :cond_2

    sget-object v2, Lcom/miui/gallery/cloud/ServerErrorCode;->sExceptionMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    :cond_2
    :goto_1
    return v0
.end method

.method private static hasDeleteItemsInAGroup(Ljava/lang/String;)Z
    .locals 10

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getCloudLimit1Uri()Landroid/net/Uri;

    move-result-object v3

    const-string v1, "_id"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "localFlag = ?  AND localGroupId = ? "

    const/4 v1, 0x2

    new-array v6, v1, [Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v8, 0x0

    aput-object v1, v6, v8

    const/4 v1, 0x1

    aput-object p0, v6, v1

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p0, :cond_1

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    if-eqz p0, :cond_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_0
    return v1

    :catchall_0
    move-exception v0

    move-object v9, v0

    move-object v0, p0

    move-object p0, v9

    goto :goto_0

    :cond_1
    if-eqz p0, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    return v8

    :catchall_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p0
.end method

.method private static hasUnCreatedGroupInLocalDB(Ljava/lang/String;)Z
    .locals 10

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getCloudLimit1Uri()Landroid/net/Uri;

    move-result-object v3

    const-string v1, "_id"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "localFlag = ?  AND _id = ? "

    const/4 v1, 0x2

    new-array v6, v1, [Ljava/lang/String;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v8, 0x0

    aput-object v1, v6, v8

    const/4 v1, 0x1

    aput-object p0, v6, v1

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p0, :cond_1

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    if-eqz p0, :cond_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_0
    return v1

    :catchall_0
    move-exception v0

    move-object v9, v0

    move-object v0, p0

    move-object p0, v9

    goto :goto_0

    :cond_1
    if-eqz p0, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_2
    return v8

    :catchall_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p0
.end method

.method public static isClientError(I)Z
    .locals 0

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
