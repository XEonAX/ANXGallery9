.class public Lcom/miui/gallery/permission/RuntimePermissions;
.super Ljava/lang/Object;
.source "RuntimePermissions.java"


# static fields
.field public static final PERMISSIONS_REQUIRED:[Ljava/lang/String;

.field public static final PERMISSION_OPTIONAL:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/permission/RuntimePermissions;->PERMISSIONS_REQUIRED:[Ljava/lang/String;

    const-string v0, "android.permission.READ_CONTACTS"

    const-string v1, "android.permission.GET_ACCOUNTS"

    const-string v2, "android.permission.READ_PHONE_STATE"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/permission/RuntimePermissions;->PERMISSION_OPTIONAL:[Ljava/lang/String;

    return-void
.end method

.method public static parsePermission(Landroid/content/Context;Ljava/lang/String;Z)Lcom/miui/gallery/permission/core/Permission;
    .locals 5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/content/pm/PackageManager;->getPermissionInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionInfo;

    move-result-object p1

    if-eqz p1, :cond_6

    const-string v0, "android.permission-group.STORAGE"

    iget-object v2, p1, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, -0x1

    if-eqz v0, :cond_1

    sget v0, Lcom/miui/gallery/permission/R$string;->permission_storage_name:I

    sget v3, Lcom/miui/gallery/permission/R$string;->permission_storage_desc:I

    goto :goto_0

    :cond_1
    const-string v0, "android.permission-group.CONTACTS"

    iget-object v3, p1, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/miui/gallery/permission/R$string;->permission_contract_name:I

    sget v3, Lcom/miui/gallery/permission/R$string;->permissin_contract_desc:I

    goto :goto_0

    :cond_2
    const-string v0, "android.permission-group.PHONE"

    iget-object v3, p1, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget v0, Lcom/miui/gallery/permission/R$string;->permission_phone_name:I

    sget v3, Lcom/miui/gallery/permission/R$string;->permission_phone_desc:I

    goto :goto_0

    :cond_3
    const/4 v0, -0x1

    const/4 v3, -0x1

    :goto_0
    if-eq v0, v2, :cond_4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const-string v0, ""

    :goto_1
    if-eq v3, v2, :cond_5

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    :cond_5
    const-string p0, ""

    :goto_2
    new-instance v2, Lcom/miui/gallery/permission/core/Permission;

    iget-object p1, p1, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    invoke-direct {v2, p1, v0, p0, p2}, Lcom/miui/gallery/permission/core/Permission;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    :cond_6
    return-object v1
.end method
