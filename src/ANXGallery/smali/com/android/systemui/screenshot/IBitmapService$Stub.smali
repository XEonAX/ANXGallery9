.class public abstract Lcom/android/systemui/screenshot/IBitmapService$Stub;
.super Landroid/os/Binder;
.source "IBitmapService.java"

# interfaces
.implements Lcom/android/systemui/screenshot/IBitmapService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/screenshot/IBitmapService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.android.systemui.screenshot.IBitmapService"

    invoke-virtual {p0, p0, v0}, Lcom/android/systemui/screenshot/IBitmapService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "com.android.systemui.screenshot.IBitmapService"

    const v1, 0x5f4e5446

    const/4 v2, 0x1

    if-eq p1, v1, :cond_0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    :pswitch_0
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/android/systemui/screenshot/IScreenShotCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/systemui/screenshot/IScreenShotCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/systemui/screenshot/IBitmapService$Stub;->unregisterCallback(Lcom/android/systemui/screenshot/IScreenShotCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/android/systemui/screenshot/IScreenShotCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/systemui/screenshot/IScreenShotCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/systemui/screenshot/IBitmapService$Stub;->registerCallback(Lcom/android/systemui/screenshot/IScreenShotCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :cond_0
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
