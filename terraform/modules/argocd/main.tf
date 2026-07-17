# ۱. ساخت نیم‌اسپیس اختصاصی برای ArgoCD
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# ۲. نصب ArgoCD از ریپازیتوری رسمی با استفاده از هلم
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.3.11" # نسخه پایدار و مطمئن هلم چارت
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  # غیرفعال کردن موقت SSL برای محیط‌های توسعه جهت تست راحت‌تر لوکال
  set {
    name  = "configs.params.server\\.insecure"
    value = "true"
  }
}
