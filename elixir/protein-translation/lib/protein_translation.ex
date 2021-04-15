defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """

  defguard is_valid_codon(codon)
           when codon in [
                  "UGU",
                  "UGC",
                  "UUA",
                  "UUG",
                  "AUG",
                  "UUU",
                  "UUC",
                  "UCU",
                  "UCC",
                  "UCA",
                  "UCG",
                  "UGG",
                  "UAU",
                  "UAC",
                  "UAA",
                  "UAG",
                  "UGA"
                ]

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
    |> get_codons
    |> get_output
  end

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
  def of_codon(codon) when is_valid_codon(codon) do
    {:ok, @codons[codon]}
  end

  def of_codon(_other), do: {:error, "invalid codon"}

  defp get_output(list) do
    if Enum.all?(list, fn x -> is_valid_codon(x) == true end) == true do
      list
      |> Enum.reduce([], fn x, acc -> [get_protein(x) | acc] end)
      |> Enum.reverse()
      |> create_tuple
    else
      {:error, "invalid RNA"}
    end
  end

  defp get_codons(rna) do
    rna
    |> String.graphemes()
    |> Enum.chunk_every(3)
    |> Enum.map(fn x -> Enum.join(x) end)
  end

  defp get_protein(codon), do: @codons[codon]

  defp create_tuple(protein_list) do
    if "STOP" in protein_list == false do
      {:ok, protein_list}
    else
      {a, b} = Enum.split_while(protein_list, fn x -> x != "STOP" end)
      {:ok, a}
    end
  end
end
