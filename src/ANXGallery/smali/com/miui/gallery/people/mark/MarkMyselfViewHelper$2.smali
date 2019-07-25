.class Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$2;
.super Ljava/lang/Object;
.source "MarkMyselfViewHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$2;->this$0:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$2;->this$0:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    invoke-static {p1}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->access$000(Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->ignoreSuggestion()V

    return-void
.end method
