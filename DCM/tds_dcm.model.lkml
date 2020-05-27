connection: "mc_panoply"

include: "/DCM/**/*.view"

explore: tds_dcm_extended {
  extends: [tds_dcm]
  hidden: no
}
