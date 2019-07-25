.class public Lcom/miui/gallery/search/widget/SearchView;
.super Landroid/widget/LinearLayout;
.source "SearchView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;
    }
.end annotation


# instance fields
.field private mEditText:Lmiui/widget/ClearableEditText;

.field private mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

.field private mVoiceButton:Landroid/view/View;

.field private mVoiceButtonEnabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/search/widget/SearchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/widget/SearchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButtonEnabled:Z

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b014e

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 p3, -0x2

    invoke-direct {p1, p2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/widget/SearchView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const p1, 0x7f090289

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lmiui/widget/ClearableEditText;

    iput-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    new-instance p2, Lcom/miui/gallery/search/widget/SearchView$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/search/widget/SearchView$1;-><init>(Lcom/miui/gallery/search/widget/SearchView;)V

    invoke-virtual {p1, p2}, Lmiui/widget/ClearableEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    new-instance p2, Lcom/miui/gallery/search/widget/SearchView$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/search/widget/SearchView$2;-><init>(Lcom/miui/gallery/search/widget/SearchView;)V

    invoke-virtual {p1, p2}, Lmiui/widget/ClearableEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    new-instance p2, Lcom/miui/gallery/search/widget/SearchView$3;

    invoke-direct {p2, p0}, Lcom/miui/gallery/search/widget/SearchView$3;-><init>(Lcom/miui/gallery/search/widget/SearchView;)V

    invoke-virtual {p1, p2}, Lmiui/widget/ClearableEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const p1, 0x7f090284

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090285

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButton:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButton:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/SearchView;->updateVoiceButtonState()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/widget/SearchView;)Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/widget/SearchView;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/widget/SearchView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/SearchView;->updateVoiceButtonState()V

    return-void
.end method

.method private getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/SearchView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    return-object v0
.end method

.method private updateVoiceButtonState()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButtonEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0}, Lmiui/widget/ClearableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public clearFocus()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->clearFocus()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/SearchView;->hideInputMethod()Z

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0}, Lmiui/widget/ClearableEditText;->clearFocus()V

    return-void
.end method

.method public getQueryText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0}, Lmiui/widget/ClearableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hideInputMethod()Z
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/SearchView;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v2}, Lmiui/widget/ClearableEditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    invoke-interface {p1, p0}, Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;->onStartVoiceAssistant(Landroid/view/View;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    invoke-interface {p1, p0}, Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;->onCancelSearch(Landroid/view/View;)V

    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f090284
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public selectAll(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {p1}, Lmiui/widget/ClearableEditText;->selectAll()V

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/SearchView;->getQueryText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/SearchView;->getQueryText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Lmiui/widget/ClearableEditText;->setSelection(I)V

    :goto_1
    return-void
.end method

.method public setCursorVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0, p1}, Lmiui/widget/ClearableEditText;->setCursorVisible(Z)V

    return-void
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0, p1}, Lmiui/widget/ClearableEditText;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setQueryText(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0, p1}, Lmiui/widget/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setSearchViewListener(Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    return-void
.end method

.method public setVoiceButtonEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/widget/SearchView;->mVoiceButtonEnabled:Z

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/SearchView;->updateVoiceButtonState()V

    return-void
.end method

.method public showInputMethod()Z
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/SearchView;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v2}, Lmiui/widget/ClearableEditText;->requestFocus()Z

    iget-object v2, p0, Lcom/miui/gallery/search/widget/SearchView;->mEditText:Lmiui/widget/ClearableEditText;

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    move-result v0

    return v0

    :cond_0
    return v1
.end method
