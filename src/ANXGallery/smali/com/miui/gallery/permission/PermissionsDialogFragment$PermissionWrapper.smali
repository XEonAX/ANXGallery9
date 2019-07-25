.class Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;
.super Lcom/miui/gallery/permission/core/Permission;
.source "PermissionsDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/permission/PermissionsDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PermissionWrapper"
.end annotation


# instance fields
.field private final mIsCategory:Z


# direct methods
.method public constructor <init>(Lcom/miui/gallery/permission/core/Permission;Z)V
    .locals 3

    iget-object v0, p1, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    iget-object v1, p1, Lcom/miui/gallery/permission/core/Permission;->mName:Ljava/lang/String;

    iget-object v2, p1, Lcom/miui/gallery/permission/core/Permission;->mDesc:Ljava/lang/String;

    iget-boolean p1, p1, Lcom/miui/gallery/permission/core/Permission;->mRequired:Z

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/miui/gallery/permission/core/Permission;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    iput-boolean p2, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;->mIsCategory:Z

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;->mIsCategory:Z

    return p0
.end method
