defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @rna %{"G" => "C", "C" => "G", "T" => "A", "A" => "U"}

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    String.graphemes(dna)
    |> Enum.map(fn key -> @rna[key] end)
    |> Enum.join()
  end
end
