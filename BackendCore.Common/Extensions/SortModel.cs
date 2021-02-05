namespace BackendCore.Common.Extensions
{
    public class SortModel
    {
        public string ColId { get; set; } = "createdDate";
        public string Sort { get; set; } = "desc";
        public string PairAsSqlExpression => $"{ColId} {Sort}";
    }
}
