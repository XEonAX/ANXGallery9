.class public abstract Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub;
.super Landroid/os/Binder;
.source "INexAssetDataCallback.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub$a;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.nexstreaming.nexeditorsdk.service.INexAssetDataCallback"

.field static final TRANSACTION_onLoadAssetDatas:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.nexstreaming.nexeditorsdk.service.INexAssetDataCallback"

    invoke-virtual {p0, p0, v0}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.nexstreaming.nexeditorsdk.service.INexAssetDataCallback"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;

    return-object v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub$a;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub$a;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const v1, 0x5f4e5446

    if-eq p1, v1, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    :cond_0
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetDataCallback"

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    :cond_1
    const-string p1, "com.nexstreaming.nexeditorsdk.service.INexAssetDataCallback"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback$Stub;->onLoadAssetDatas(Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v0
.end method
