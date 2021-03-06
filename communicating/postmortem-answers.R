#
# postmortem-answers.R, 5 Dec 13
#
# Data from:
# Plat_Forms 2007: The web development platform comparison - evaluation and results
#
# Example from:
# Empirical Software Engineering using R
# Derek M. Jones

source("ESEUR_config.r")

pm_ans=read.csv(paste0(ESEUR_dir, "communicating/postmortem-answers.csv.xz"), as.is=TRUE, sep="\t")
team_lang=read.csv(paste0(ESEUR_dir, "communicating/team-lang.csv.xz"), as.is=TRUE)

pm_ans$language=team_lang$language[pm_ans$team]

brew_col=rainbow_hcl(3)

boxplot(experience ~ language, data=pm_ans, col=brew_col,
	ylab="Years experience")

shapiro.test(subset(pm_ans, language=="Perl")$experience)

t.test(subset(pm_ans, language=="Perl")$experience,
       subset(pm_ans, language=="PHP")$experience)
