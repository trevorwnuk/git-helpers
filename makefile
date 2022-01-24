list_merged_prs:      ## Show PR's merged between two Change Request deployment tags
	chmod +x ./scripts/list_merged_prs.sh && ./scripts/list_merged_prs.sh $(prev) $(curr)
list_tags:            ## Show details on recent Change Request deployment tags
	git tag -l --sort=-creatordate --format='%(creatordate):  %(refname:short)' | head -n $(if $(n),$(n),10)