/* ============================================================================================
# Remember to link to the correct GCP service account first for this to work
# STEP 1. On GCP Console, visit IAM & Admin --> Service Accounts
# STEP 2. Create a new Service Account, like "terraform-service-account"
# STEP 3. Add appropriate permission, like Compute Engine Admin, Network Management Admin, etc.
# STEP 4. Once created, click no the ellipsis (three dots) and select "Create Key", choose JSON
# STEP 5. Save it on hard disk - somewhere safe
# STEP 6. Add an environment variable pointing at the full path of this JSON file:
          export GOOGLE_CLOUD_KEYFILE_JSON="/path/to/credentials.json"
# STEP 7. To make the environment variable permanent, add the same line in ~/.bashrc
# =========================================================================================== */

provider "google" {
        project         = "cr-lab-kbiswas-2304204819"
	version		= "~> 3.20"
	region		= "us-central1"
	zone		= "us-central1-c"
}

module "vpc_for_my_web_servers" {
	source		= "../modules/networking"
	company		= "aran"
	env		= "dev"
}
