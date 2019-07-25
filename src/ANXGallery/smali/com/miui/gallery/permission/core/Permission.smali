.class public Lcom/miui/gallery/permission/core/Permission;
.super Ljava/lang/Object;
.source "Permission.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/permission/core/Permission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mDesc:Ljava/lang/String;

.field public final mName:Ljava/lang/String;

.field public final mPermissionGroup:Ljava/lang/String;

.field public final mRequired:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/permission/core/Permission$1;

    invoke-direct {v0}, Lcom/miui/gallery/permission/core/Permission$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/permission/core/Permission;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/permission/core/Permission;->mName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/permission/core/Permission;->mDesc:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/miui/gallery/permission/core/Permission;->mRequired:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/permission/core/Permission;->mName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/permission/core/Permission;->mDesc:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/miui/gallery/permission/core/Permission;->mRequired:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/permission/core/Permission;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    check-cast p1, Lcom/miui/gallery/permission/core/Permission;

    iget-object p1, p1, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/permission/core/Permission;->mPermissionGroup:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/permission/core/Permission;->mName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/permission/core/Permission;->mDesc:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean p2, p0, Lcom/miui/gallery/permission/core/Permission;->mRequired:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    return-void
.end method
