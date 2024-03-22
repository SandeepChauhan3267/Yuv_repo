module "Yuv_rg" {
  source = "../Resourcegroup"
  Yuvrgs = var.Yuvrgs
}

module "Yuv_Storageaccount" {
  source     = "../StorageAccount"
  depends_on = [module.Yuv_rg]
}

module "Yuv_Subnet" {
  source     = "../Subnet"
  Yuvsubnet  = var.Yuvsubnet
  depends_on = [module.Yuv_rg]
}

module "Yuv_Virtualnetwork" {
  source     = "../Virtualnetwork"
  depends_on = [module.Yuv_rg]
}


module "Yuv_Publicip" {
  source       = "../PublicIP"
  Yuvpublicips = var.Yuvpublicips
  depends_on   = [module.Yuv_rg]
}

module "Yuv_Networkinterface" {
  source     = "../Networkinterface"
  Yuvnics    = var.Yuvnics
  depends_on = [module.Yuv_rg, module.Yuv_Virtualnetwork]
}


module "Yuv_NSG" {
  source     = "../Networksecuritygroup"
  depends_on = [module.Yuv_rg, module.Yuv_Networkinterface]
}

module "Yuv_Bastion" {
  source     = "../Bastion"
  depends_on = [module.Yuv_rg, module.Yuv_Publicip, module.Yuv_Virtualnetwork]
}

module "Yuv_Virtualmachine" {
  source     = "../VirtualMachine"
  Yuvvms     = var.Yuvvms
  depends_on = [module.Yuv_rg, module.Yuv_Networkinterface]
}

module "Yuv_Loadbalancer" {
  source     = "../LoadBalancer"
  lb         = var.lb
  depends_on = [module.Yuv_rg, module.Yuv_Virtualmachine]
}

module "Yuv_Keyvault" {
  source = "../Keyvault"
  kv = var.kv
} 

 module "Yuv_Database" {
  source =  "../Database"
  dbs    = var.dbs
  db     = var.db
  depends_on = [ module.Yuv_rg, module.Yuv_Keyvault ]
}
