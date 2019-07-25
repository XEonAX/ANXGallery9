.class public Lcom/miui/gallery/util/SoundUtils;
.super Ljava/lang/Object;
.source "SoundUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/SoundUtils$SoundJob;
    }
.end annotation


# direct methods
.method static synthetic access$000(Landroid/content/Context;I)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SoundUtils;->internalPlaySoundForOperation(Landroid/content/Context;I)V

    return-void
.end method

.method private static getRingtoneUriForOperation(I)Landroid/net/Uri;
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    move-object p0, v0

    goto :goto_0

    :cond_0
    const-string p0, "/system/media/audio/ui/Delete.ogg"

    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_1
    const-string p0, "SoundUtils"

    const-string v2, "Sound file %s do not exist"

    invoke-static {p0, v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    return-object v0
.end method

.method private static internalPlaySoundForOperation(Landroid/content/Context;I)V
    .locals 2

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SoundUtils;->shouldPlaySoundForOperation(Landroid/content/Context;I)Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, "SoundUtils"

    const-string v0, "Shouldn\'t play sound for operation %s, just return"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/SoundUtils;->getRingtoneUriForOperation(I)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p0, "SoundUtils"

    const-string v0, "No sound resource found for operation %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    invoke-static {p0, v0}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object p0

    if-nez p0, :cond_2

    const-string p0, "SoundUtils"

    const-string v1, "Get ringtone failed for operation %s, sound source %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v1, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/util/SoundUtils;->setRingtoneStream(Landroid/media/Ringtone;)V

    invoke-virtual {p0}, Landroid/media/Ringtone;->play()V

    return-void
.end method

.method public static playSoundForOperation(Landroid/content/Context;I)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->isMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/SoundUtils$SoundJob;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/SoundUtils$SoundJob;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/miui/gallery/util/SoundUtils;->internalPlaySoundForOperation(Landroid/content/Context;I)V

    :goto_0
    return-void
.end method

.method private static setRingtoneStream(Landroid/media/Ringtone;)V
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x15

    if-lt v0, v2, :cond_0

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/media/Ringtone;->setAudioAttributes(Landroid/media/AudioAttributes;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v1}, Landroid/media/Ringtone;->setStreamType(I)V

    :goto_0
    return-void
.end method

.method private static shouldPlaySoundForOperation(Landroid/content/Context;I)Z
    .locals 3

    const/4 v0, 0x1

    if-nez p1, :cond_1

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p1, "delete_sound_effect"

    invoke-static {p0, p1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result p0

    const-string p1, "SoundUtils"

    const-string v1, "Got sound setting value %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :catch_0
    move-exception p0

    const-string p1, "SoundUtils"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return v0
.end method
