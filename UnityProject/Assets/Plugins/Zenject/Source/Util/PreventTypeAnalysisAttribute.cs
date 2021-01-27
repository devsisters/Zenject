/**
 * Created by jameskim on 2021-01-27
 */

using System;

namespace Zenject
{
    [AttributeUsage(AttributeTargets.Struct | AttributeTargets.Class)]
    public class PreventTypeAnalysisAttribute : Attribute { }
}