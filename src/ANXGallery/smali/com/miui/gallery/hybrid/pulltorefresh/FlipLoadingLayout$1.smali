.class synthetic Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout$1;
.super Ljava/lang/Object;
.source "FlipLoadingLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->values()[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    :try_start_0
    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
