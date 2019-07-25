.class public Lcom/miui/gallery/permission/core/PermissionCheckHelper;
.super Ljava/lang/Object;
.source "PermissionCheckHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

.field private mIsShowWhenLocked:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;ZLcom/miui/gallery/permission/core/PermissionCheckCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    if-eqz p3, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mIsShowWhenLocked:Z

    iput-object p3, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "PermissionCheckHelper: activity or callback can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/permission/core/PermissionCheckHelper;)Lcom/miui/gallery/permission/core/PermissionCheckCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/permission/core/PermissionCheckHelper;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/permission/core/PermissionCheckHelper;[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->showPermissionIntroduction([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/permission/core/PermissionCheckHelper;[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->requestPermissions([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;)V

    return-void
.end method

.method private filterResults([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)[Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    iget v4, v3, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->result:I

    if-ne v4, p2, :cond_0

    iget-object v3, v3, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->permission:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method private initResults([Ljava/lang/String;)[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;
    .locals 4

    array-length v0, p1

    new-array v0, v0, [Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    new-instance v2, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;-><init>(Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;)V

    aput-object v2, v0, v1

    aget-object v2, v0, v1

    aget-object v3, p1, v1

    iput-object v3, v2, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->permission:Ljava/lang/String;

    aget-object v2, v0, v1

    const/4 v3, -0x1

    iput v3, v2, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->result:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private requestPermissions([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;)V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->filterResults([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)[Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    invoke-static {v1, p1}, Lcom/miui/gallery/permission/core/PermissionUtils;->getUngrantedPermissions(Landroid/app/Activity;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mIsShowWhenLocked:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->startActivity(Landroid/app/Activity;Ljava/util/List;Z)V

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    const/16 v0, 0x2e

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/permission/core/PermissionUtils;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    :cond_1
    array-length v1, p1

    new-array v1, v1, [I

    invoke-static {v1, v0}, Ljava/util/Arrays;->fill([II)V

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->onPermissionsChecked([Ljava/lang/String;[I)V

    :goto_0
    return-void
.end method

.method private showPermissionIntroduction([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    iget-object v1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    aget-object v2, p1, p2

    iget-object v2, v2, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->permission:Ljava/lang/String;

    new-instance v3, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;

    invoke-direct {v3, p0, p1, p2}, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;-><init>(Lcom/miui/gallery/permission/core/PermissionCheckHelper;[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->showPermissionIntroduction(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    return-void
.end method


# virtual methods
.method public checkPermission()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    invoke-interface {v0}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->getRuntimePermissions()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v2, v0

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->initResults([Ljava/lang/String;)[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->showPermissionIntroduction([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V

    return-void

    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    new-array v1, v1, [I

    invoke-interface {v2, v0, v1}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->onPermissionsChecked([Ljava/lang/String;[I)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 5

    const/16 v0, 0x2e

    if-ne p1, v0, :cond_3

    if-eqz p2, :cond_3

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_1

    aget v3, p3, v1

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    aget-object v4, p2, v1

    invoke-interface {v3, v4}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->isPermissionRequired(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    aget-object v2, p2, v1

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mCallback:Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    invoke-interface {p1, p2, p3}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->onPermissionsChecked([Ljava/lang/String;[I)V

    goto :goto_1

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    iget-boolean p3, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mIsShowWhenLocked:Z

    invoke-static {p2, p1, p3}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->startActivity(Landroid/app/Activity;Ljava/util/List;Z)V

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_3
    :goto_1
    return-void
.end method
