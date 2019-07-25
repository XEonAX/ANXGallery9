.class public Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;
.super Ljava/lang/Object;
.source "RuntimePermissionsIntroduction.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAllOptionalPermissions()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/permission/RuntimePermissions;->PERMISSION_OPTIONAL:[Ljava/lang/String;

    return-object v0
.end method

.method private static getAllRequiredPermissions()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/permission/RuntimePermissions;->PERMISSIONS_REQUIRED:[Ljava/lang/String;

    return-object v0
.end method

.method private static parsePermissions(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/permission/core/Permission;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {}, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;->getAllRequiredPermissions()[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    array-length v4, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v2, v5

    const/4 v7, 0x1

    invoke-static {p0, v6, v7}, Lcom/miui/gallery/permission/RuntimePermissions;->parsePermission(Landroid/content/Context;Ljava/lang/String;Z)Lcom/miui/gallery/permission/core/Permission;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;->getAllOptionalPermissions()[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    array-length v4, v2

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_3

    aget-object v6, v2, v5

    invoke-static {p0, v6, v3}, Lcom/miui/gallery/permission/RuntimePermissions;->parsePermission(Landroid/content/Context;Ljava/lang/String;Z)Lcom/miui/gallery/permission/core/Permission;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    return-object v0
.end method


# virtual methods
.method public introduce(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/BaseGalleryPreferences$PermissionIntroduction;->isRuntimePermissionsIntroduced()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p1, 0x1

    invoke-interface {p3, p1}, Lcom/miui/gallery/permission/core/OnPermissionIntroduced;->onPermissionIntroduced(Z)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;->parsePermissions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction$1;

    invoke-direct {v0, p0, p3}, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction$1;-><init>(Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    invoke-static {p2, v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->newInstance(Ljava/util/ArrayList;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)Lcom/miui/gallery/permission/PermissionsDialogFragment;

    move-result-object p2

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string p3, "PermissionsDialogFragment"

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
