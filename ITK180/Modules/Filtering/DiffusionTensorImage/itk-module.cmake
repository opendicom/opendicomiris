set(DOCUMENTATION "This module contains classes intended to generate or procees
diffusion tensor images. In particular you will find here the filter that
computes a tensor image from a set of gradient images.")

itk_module(ITKDiffusionTensorImage
  DEPENDS
    ITKImageFeature
    ITKSpatialObjects
  TEST_DEPENDS
    ITKTestKernel
  DESCRIPTION
    "${DOCUMENTATION}"
)
