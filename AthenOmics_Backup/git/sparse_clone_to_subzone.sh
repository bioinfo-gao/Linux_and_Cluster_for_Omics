# 1. Create a directory for the project and enter it
mkdir -p /home/songz/gaoz/Linux_Cluster_Project
cd /home/songz/gaoz/Linux_Cluster_Project

# 2. Initialize git
git init

# 3. Add remote origin
git remote add origin https://github.com/bioinfo-gao/Linux_and_Cluster_for_Omics.git

# 4. Enable sparse-checkout and set the target folder
git sparse-checkout set AthenOmics_Backup

# 5. Pull the content (This will only download the specified folder)
git pull origin master