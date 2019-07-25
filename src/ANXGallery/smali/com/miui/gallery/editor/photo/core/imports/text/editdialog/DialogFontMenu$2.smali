.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;
.super Ljava/lang/Object;
.source "DialogFontMenu.java"

# interfaces
.implements Lcom/miui/gallery/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->loadResourceData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

.field final synthetic val$startTime:J


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;J)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iput-wide p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->val$startTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string v2, "DialogFontMenu"

    const-string v3, "loadResourceData success, use time %s  ms"

    iget-wide v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->val$startTime:J

    sub-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    if-nez v0, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getExtraInfo()Lcom/miui/gallery/editor/photo/core/imports/text/model/ExtraInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/model/ExtraInfo;->isDarkModeData()Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    if-eqz v0, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getExtraInfo()Lcom/miui/gallery/editor/photo/core/imports/text/model/ExtraInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/model/ExtraInfo;->isDarkModeData()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/TextTools;->checkResourceExist(Ljava/util/List;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;)V

    invoke-static {p1}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    const-string p3, "DialogFontMenu"

    const-string v0, "loadResourceData error: %s, errorCode: %s"

    invoke-virtual {p1}, Lcom/miui/gallery/net/base/ErrorCode;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, v0, p2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/TextTools;->checkResourceExist(Ljava/util/List;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;)V

    invoke-static {p1}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method
