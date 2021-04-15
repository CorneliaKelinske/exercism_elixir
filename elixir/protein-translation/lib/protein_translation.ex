defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """

  @codons %{
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UGG" => "Tryptophan",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"

  }
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> String.graphemes
    |> Enum.chunk_every(3)
    |> Enum.map(fn x -> Enum.join(x) end)
    |> Enum.reduce([], fn x, acc -> [get_protein(x)| acc] end)
    |> Enum.reverse
    |> create_tuple


  end

  defp get_protein(codon), do: @codons[codon]

  defp create_tuple(protein_list), do: {:ok, protein_list}

  @doc """
  Given a codon, return the corresponding protein

  UGU => Cysteine
  UGC => Cysteine
  UUA => Leucine
  UUG => Leucine
  AUG => Methionine
  UUU => Phenylalanine
  UUC => Phenylalanine
  UCU => Serine
  UCC => Serine
  UCA => Serine
  UCG => Serine
  UGG => Tryptophan
  UAU => Tyrosine
  UAC => Tyrosine
  UAA => STOP
  UAG => STOP
  UGA => STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    {:ok, @codons[codon]}
  end
end
