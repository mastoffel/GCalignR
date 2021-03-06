% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GC_Heatmap.R
\name{gc_heatmap}
\alias{gc_heatmap}
\title{Visualises peak alignments in form of a heatmap}
\usage{
gc_heatmap(
  object = NULL,
  algorithm_step = c("aligned", "shifted", "input"),
  substance_subset = NULL,
  legend_type = c("legend", "colourbar"),
  samples_subset = NULL,
  type = c("binary", "discrete"),
  threshold = NULL,
  label_size = NULL,
  show_legend = TRUE,
  main_title = NULL,
  label = c("y", "xy", "x", "none")
)
}
\arguments{
\item{object}{Object of class "GCalign", the output of a call to \code{\link{align_chromatograms}}.}

\item{algorithm_step}{Character indicating which step of the algorithm is plotted. Either "input", "shifted" or "aligned" specifying the raw, linearly shifted or aligned data respectively. Default is the heatmap for the aligned dataset.}

\item{substance_subset}{A vector of integers containing indices of substances in ascending order of retention times to plot.}

\item{legend_type}{A character specifying how to present deviations of retention times from the mean. Either in form of discrete steps or on a gradient scale using 'legend' or 'colourbar' respectively. Changes are only possible when \code{type = "discrete"}}

\item{samples_subset}{A vector indicating which samples are plotted on the heatmap by giving either indices or names of samples.}

\item{type}{A character specifying whether a deviations of retention times are shown 'binary' (i.e. in comparison to the threshold value) or on a 'discrete' scale with respect to the mean retention time.}

\item{threshold}{A numeric value denoting the threshold above which the deviation of individual peak retention times from the mean retention time of the respective substance are highlighted in heatmaps. By default, the value of parameter \code{max_diff_peak2mean} (see \code{\link{align_chromatograms}}) that was used in aligning the data is used.}

\item{label_size}{An integer determining the size of labels on y and x axis. By default a fitting label_size is calculate (beta!) to compromise between readability and messiness due to a potentially large number of substances and samples.}

\item{show_legend}{Boolean determining whether a legend is included or not.}

\item{main_title}{Character giving the title of the heatmap. If not specified, titles are generated automatically.}

\item{label}{Character determining if labels are shown on axes. Depending on the number of peaks and/or samples, labels are difficult to read. Use subsets instead. Possible option are "xy", "x", "y" or "none"}
}
\value{
object of class "ggplot"
}
\description{
The goal of aligning peaks is to match homologous peaks that are thought to represent homologous substances in the same row across samples, although peaks have slightly different retention times across samples. This function makes it possible to evaluate the alignment quickly by inspecting the (i) distribution of peaks across samples, (ii) the variation for each homologous peak (column) as well as (iii) patterns that might hint at splitting peaks across rows. The mean retention time per homologous peak is here defined as the "true"  retention time and deviations of individual peaks can be seen by a large deviation in the retention time to the mean. Subsetting of the retention time range (i.e. selecting peaks by the mean retention time) and samples (by name or by position) allow to quickly inspect regions of interest. Two types of heatmaps are available, a binary heatmap allows to determine if the retention time of single samples deviates by more than the user defined threshold from the mean. Optionally, a discrete heatmap allows to check deviations quantitatively. Large deviation can have multiple reasons. The most likely explanation is given by the fact that adjacent rows were merged as specified by the value \code{min_diff_peak2peak} in \code{\link{align_chromatograms}}. Here clear cases, in which peaks of multiple samples have been grouped in either of two or more rows can be merged and cause relatively high variation in peak retention times.
}
\examples{

 ## aligned gc-dataset
 data("aligned_peak_data")
 ## Default settings: The final output is plotted
 gc_heatmap(aligned_peak_data, algorithm_step = "aligned")

 ## Plot the input data
 gc_heatmap(aligned_peak_data,algorithm_step = "input")

 ## Plot a subset of the first 50 scored substances
 gc_heatmap(aligned_peak_data,algorithm_step="aligned",substance_subset = 1:50)

 ## Plot specific samples, apply a stricter threshold
 gc_heatmap(aligned_peak_data,samples_subset = c("M2","P7","M13","P13"),threshold = 0.02)

}
\author{
Martin Stoffel (martin.adam.stoffel@gmail.com) &
        Meinolf Ottensmann (meinolf.ottensmann@web.de)
}
